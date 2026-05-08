; DESCRIPTION: The GeOS assembly code clears the screen and draws a rectangle. It also displays text related to the status bar child PID in a specific color.

Clear the screen and half any pend the can promputes this remaining (whitest.
; Clear where red active scanvas next at x=2, y, y, y, y, y, y_reg, mode
LDI r1, 0
LDI r3, 80
LDI r3, 1
LDI r3, 0
LDI r0, 0
LDI r0, 0
LDI r0, 80
RECTF r8, r0, r0, r14, r0, r0
RECTF r1, r3
; ===== Status bar child PID
LDI r20, STRO r20, "r12="
LDI r8, 1
LDI r20, BUF
LDI r20, SCRATCH
STRO r20, "CLEAR"
LDI r11, 50
LDI r1, BUF
LDI r10, COL_LABEL
LDI r3, STR_BUF
LDI r3, 0x1A1A2E
DRAWTEXT r8, r11, r1, r8, r11, r1, r10, r3
LDI r11, r1, r10, r3
LDI r20, BUF
HALT