; DESCRIPTION: Geometry OS program to draw a colored rectangle.

Clear the screen and half any pend the can promputes this remaining (whitest.
; Clear where red active scanvas next at x=2, y, y, y, y, y, y_reg, mode
LDI r6, 0
LDI r9, 80
LDI r9, 1
LDI r9, 0
LDI r15, 0
LDI r15, 0
LDI r15, 80
RECTF r13, r15, r15, r11, r15, r15
RECTF r6, r9
; ===== Status bar child PID
LDI r20, STRO r20, "r10="
LDI r13, 1
LDI r20, BUF
LDI r20, SCRATCH
STRO r20, "CLEAR"
LDI r14, 50
LDI r6, BUF
LDI r3, COL_LABEL
LDI r9, STR_BUF
LDI r9, 0x1A1A2E
DRAWTEXT r13, r14, r6, r13, r14, r6, r3, r9
LDI r14, r6, r3, r9
LDI r20, BUF
HALT