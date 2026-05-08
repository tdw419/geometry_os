; DESCRIPTION: Draw rectangle: pos=the screen, color=colored, size=fixed size.

Clear the screen and half any pend the can promputes this remaining (whitest.
; Clear where red active scanvas next at x=2, y, y, y, y, y, y_reg, mode
LDI r4, 0
LDI r11, 80
LDI r11, 1
LDI r11, 0
LDI r7, 0
LDI r7, 0
LDI r7, 80
RECTF r10, r7, r7, r13, r7, r7
RECTF r4, r11
; ===== Status bar child PID
LDI r20, STRO r20, "r1="
LDI r10, 1
LDI r20, BUF
LDI r20, SCRATCH
STRO r20, "CLEAR"
LDI r15, 50
LDI r4, BUF
LDI r3, COL_LABEL
LDI r11, STR_BUF
LDI r11, 0x1A1A2E
DRAWTEXT r10, r15, r4, r10, r15, r4, r3, r11
LDI r15, r4, r3, r11
LDI r20, BUF
HALT