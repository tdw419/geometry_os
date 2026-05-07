; DESCRIPTION: The GeOS assembly code clears the screen and draws a rectangle. It also displays text related to the status bar child PID in a specific color.

Clear the screen and half any pend the can promputes this remaining (whitest.
; Clear where red active scanvas next at x=2, y, y, y, y, y, y_reg, mode
LDI r3, 0
LDI r5, 80
LDI r5, 1
LDI r5, 0
LDI r6, 0
LDI r6, 0
LDI r6, 80
RECTF r1, r6, r6, r7, r6, r6
RECTF r3, r5
; ===== Status bar child PID
LDI r20, STRO r20, "r0="
LDI r1, 1
LDI r20, BUF
LDI r20, SCRATCH
STRO r20, "CLEAR"
LDI r2, 50
LDI r3, BUF
LDI r4, COL_LABEL
LDI r5, STR_BUF
LDI r5, 0x1A1A2E
DRAWTEXT r1, r2, r3, r1, r2, r3, r4, r5
LDI r2, r3, r4, r5
LDI r20, BUF
HALT