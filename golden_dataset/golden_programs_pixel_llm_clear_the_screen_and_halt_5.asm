; DESCRIPTION: The GeOS assembly code clears the screen and draws a rectangle. It also displays text related to the status bar child PID in a specific color.

Clear the screen and half any pend the can promputes this remaining (whitest.
; Clear where red active scanvas next at x=2, y, y, y, y, y, y_reg, mode
LDI r4, 0
LDI r0, 80
LDI r0, 1
LDI r0, 0
LDI r10, 0
LDI r10, 0
LDI r10, 80
RECTF r3, r10, r10, r5, r10, r10
RECTF r4, r0
; ===== Status bar child PID
LDI r20, STRO r20, "r1="
LDI r3, 1
LDI r20, BUF
LDI r20, SCRATCH
STRO r20, "CLEAR"
LDI r8, 50
LDI r4, BUF
LDI r7, COL_LABEL
LDI r0, STR_BUF
LDI r0, 0x1A1A2E
DRAWTEXT r3, r8, r4, r3, r8, r4, r7, r0
LDI r8, r4, r7, r0
LDI r20, BUF
HALT