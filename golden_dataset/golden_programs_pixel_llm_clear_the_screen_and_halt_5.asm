; DESCRIPTION: Geometry OS program to draw a colored rectangle.

Clear the screen and half any pend the can promputes this remaining (whitest.
; Clear where red active scanvas next at x=2, y, y, y, y, y, y_reg, mode
LDI r7, 0
LDI r6, 80
LDI r6, 1
LDI r6, 0
LDI r5, 0
LDI r5, 0
LDI r5, 80
RECTF r14, r5, r5, r1, r5, r5
RECTF r7, r6
; ===== Status bar child PID
LDI r20, STRO r20, "r8="
LDI r14, 1
LDI r20, BUF
LDI r20, SCRATCH
STRO r20, "CLEAR"
LDI r3, 50
LDI r7, BUF
LDI r12, COL_LABEL
LDI r6, STR_BUF
LDI r6, 0x1A1A2E
DRAWTEXT r14, r3, r7, r14, r3, r7, r12, r6
LDI r3, r7, r12, r6
LDI r20, BUF
HALT