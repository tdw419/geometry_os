; DESCRIPTION: The GeOS assembly code clears the screen and draws a rectangle. It also displays text related to the status bar child PID in a specific color.

Clear the screen and half any pend the can promputes this remaining (whitest.
; Clear where red active scanvas next at x=2, y, y, y, y, y, y_reg, mode
LDI r10, 0
LDI r7, 80
LDI r7, 1
LDI r7, 0
LDI r12, 0
LDI r12, 0
LDI r12, 80
RECTF r13, r12, r12, r15, r12, r12
RECTF r10, r7
; ===== Status bar child PID
LDI r20, STRO r20, "r11="
LDI r13, 1
LDI r20, BUF
LDI r20, SCRATCH
STRO r20, "CLEAR"
LDI r6, 50
LDI r10, BUF
LDI r4, COL_LABEL
LDI r7, STR_BUF
LDI r7, 0x1A1A2E
DRAWTEXT r13, r6, r10, r13, r6, r10, r4, r7
LDI r6, r10, r4, r7
LDI r20, BUF
HALT