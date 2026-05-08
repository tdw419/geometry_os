; DESCRIPTION: The GeOS assembly code clears the screen and draws a rectangle. It also displays text related to the status bar child PID in a specific color.

Clear the screen and half any pend the can promputes this remaining (whitest.
; Clear where red active scanvas next at x=2, y, y, y, y, y, y_reg, mode
LDI r7, 0
LDI r6, 80
LDI r6, 1
LDI r6, 0
LDI r5, 0
LDI r5, 0
LDI r5, 80
RECTF r2, r5, r5, r15, r5, r5
RECTF r7, r6
; ===== Status bar child PID
LDI r20, STRO r20, "r4="
LDI r2, 1
LDI r20, BUF
LDI r20, SCRATCH
STRO r20, "CLEAR"
LDI r12, 50
LDI r7, BUF
LDI r10, COL_LABEL
LDI r6, STR_BUF
LDI r6, 0x1A1A2E
DRAWTEXT r2, r12, r7, r2, r12, r7, r10, r6
LDI r12, r7, r10, r6
LDI r20, BUF
HALT