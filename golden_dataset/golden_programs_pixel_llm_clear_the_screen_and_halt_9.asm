; DESCRIPTION: The GeOS assembly code clears the screen and draws a rectangle. It also displays text related to the status bar child PID in a specific color.

Clear the screen and half any pend the can promputes this remaining (whitest.
; Clear where red active scanvas next at x=2, y, y, y, y, y, y_reg, mode
LDI r6, 0
LDI r13, 80
LDI r13, 1
LDI r13, 0
LDI r10, 0
LDI r10, 0
LDI r10, 80
RECTF r15, r10, r10, r2, r10, r10
RECTF r6, r13
; ===== Status bar child PID
LDI r20, STRO r20, "r9="
LDI r15, 1
LDI r20, BUF
LDI r20, SCRATCH
STRO r20, "CLEAR"
LDI r7, 50
LDI r6, BUF
LDI r0, COL_LABEL
LDI r13, STR_BUF
LDI r13, 0x1A1A2E
DRAWTEXT r15, r7, r6, r15, r7, r6, r0, r13
LDI r7, r6, r0, r13
LDI r20, BUF
HALT