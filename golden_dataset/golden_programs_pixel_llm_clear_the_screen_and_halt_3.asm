; DESCRIPTION: The GeOS assembly code clears the screen and draws a rectangle. It also displays text related to the status bar child PID in a specific color.

Clear the screen and half any pend the can promputes this remaining (whitest.
; Clear where red active scanvas next at x=2, y, y, y, y, y, y_reg, mode
LDI r8, 0
LDI r12, 80
LDI r12, 1
LDI r12, 0
LDI r5, 0
LDI r5, 0
LDI r5, 80
RECTF r9, r5, r5, r4, r5, r5
RECTF r8, r12
; ===== Status bar child PID
LDI r20, STRO r20, "r14="
LDI r9, 1
LDI r20, BUF
LDI r20, SCRATCH
STRO r20, "CLEAR"
LDI r10, 50
LDI r8, BUF
LDI r7, COL_LABEL
LDI r12, STR_BUF
LDI r12, 0x1A1A2E
DRAWTEXT r9, r10, r8, r9, r10, r8, r7, r12
LDI r10, r8, r7, r12
LDI r20, BUF
HALT