; DESCRIPTION: Geometry OS program to draw a colored rectangle.

Clear the screen and half any pend the can promputes this remaining (whitest.
; Clear where red active scanvas next at x=2, y, y, y, y, y, y_reg, mode
LDI r4, 0
LDI r5, 80
LDI r5, 1
LDI r5, 0
LDI r1, 0
LDI r1, 0
LDI r1, 80
RECTF r8, r1, r1, r10, r1, r1
RECTF r4, r5
; ===== Status bar child PID
LDI r20, STRO r20, "r3="
LDI r8, 1
LDI r20, BUF
LDI r20, SCRATCH
STRO r20, "CLEAR"
LDI r12, 50
LDI r4, BUF
LDI r13, COL_LABEL
LDI r5, STR_BUF
LDI r5, 0x1A1A2E
DRAWTEXT r8, r12, r4, r8, r12, r4, r13, r5
LDI r12, r4, r13, r5
LDI r20, BUF
HALT