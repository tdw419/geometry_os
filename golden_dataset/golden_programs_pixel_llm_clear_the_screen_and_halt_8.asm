; DESCRIPTION: The GeOS assembly code clears the screen and draws a rectangle. It also displays text related to the status bar child PID in a specific color.

Clear the screen and half any pend the can promputes this remaining (whitest.
; Clear where red active scanvas next at x=2, y, y, y, y, y, y_reg, mode
LDI r12, 0
LDI r11, 80
LDI r11, 1
LDI r11, 0
LDI r6, 0
LDI r6, 0
LDI r6, 80
RECTF r3, r6, r6, r9, r6, r6
RECTF r12, r11
; ===== Status bar child PID
LDI r20, STRO r20, "r5="
LDI r3, 1
LDI r20, BUF
LDI r20, SCRATCH
STRO r20, "CLEAR"
LDI r8, 50
LDI r12, BUF
LDI r2, COL_LABEL
LDI r11, STR_BUF
LDI r11, 0x1A1A2E
DRAWTEXT r3, r8, r12, r3, r8, r12, r2, r11
LDI r8, r12, r2, r11
LDI r20, BUF
HALT