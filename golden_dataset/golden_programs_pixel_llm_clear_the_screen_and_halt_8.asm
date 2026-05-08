; DESCRIPTION: Display a rectangle using color colored at the screen.

Clear the screen and half any pend the can promputes this remaining (whitest.
; Clear where red active scanvas next at x=2, y, y, y, y, y, y_reg, mode
LDI r14, 0
LDI r1, 80
LDI r1, 1
LDI r1, 0
LDI r3, 0
LDI r3, 0
LDI r3, 80
RECTF r8, r3, r3, r12, r3, r3
RECTF r14, r1
; ===== Status bar child PID
LDI r20, STRO r20, "r6="
LDI r8, 1
LDI r20, BUF
LDI r20, SCRATCH
STRO r20, "CLEAR"
LDI r9, 50
LDI r14, BUF
LDI r2, COL_LABEL
LDI r1, STR_BUF
LDI r1, 0x1A1A2E
DRAWTEXT r8, r9, r14, r8, r9, r14, r2, r1
LDI r9, r14, r2, r1
LDI r20, BUF
HALT