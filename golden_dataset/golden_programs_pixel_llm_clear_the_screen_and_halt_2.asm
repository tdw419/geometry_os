; DESCRIPTION: Geometry OS program to draw a colored rectangle.

Clear the screen and half any pend the can promputes this remaining (whitest.
; Clear where red active scanvas next at x=2, y, y, y, y, y, y_reg, mode
LDI r12, 0
LDI r8, 80
LDI r8, 1
LDI r8, 0
LDI r4, 0
LDI r4, 0
LDI r4, 80
RECTF r13, r4, r4, r7, r4, r4
RECTF r12, r8
; ===== Status bar child PID
LDI r20, STRO r20, "r5="
LDI r13, 1
LDI r20, BUF
LDI r20, SCRATCH
STRO r20, "CLEAR"
LDI r2, 50
LDI r12, BUF
LDI r14, COL_LABEL
LDI r8, STR_BUF
LDI r8, 0x1A1A2E
DRAWTEXT r13, r2, r12, r13, r2, r12, r14, r8
LDI r2, r12, r14, r8
LDI r20, BUF
HALT