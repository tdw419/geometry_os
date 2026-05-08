; DESCRIPTION: Display a rectangle using color colored at the screen.

Clear the screen and half any pend the can promputes this remaining (whitest.
; Clear where red active scanvas next at x=2, y, y, y, y, y, y_reg, mode
LDI r12, 0
LDI r11, 80
LDI r11, 1
LDI r11, 0
LDI r2, 0
LDI r2, 0
LDI r2, 80
RECTF r8, r2, r2, r0, r2, r2
RECTF r12, r11
; ===== Status bar child PID
LDI r20, STRO r20, "r9="
LDI r8, 1
LDI r20, BUF
LDI r20, SCRATCH
STRO r20, "CLEAR"
LDI r7, 50
LDI r12, BUF
LDI r4, COL_LABEL
LDI r11, STR_BUF
LDI r11, 0x1A1A2E
DRAWTEXT r8, r7, r12, r8, r7, r12, r4, r11
LDI r7, r12, r4, r11
LDI r20, BUF
HALT