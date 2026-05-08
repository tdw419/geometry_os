; DESCRIPTION: The GeOS assembly code clears the screen and draws a rectangle. It also displays text related to the status bar child PID in a specific color.

Clear the screen and half any pend the can promputes this remaining (whitest.
; Clear where red active scanvas next at x=2, y, y, y, y, y, y_reg, mode
LDI r4, 0
LDI r7, 80
LDI r7, 1
LDI r7, 0
LDI r0, 0
LDI r0, 0
LDI r0, 80
RECTF r5, r0, r0, r8, r0, r0
RECTF r4, r7
; ===== Status bar child PID
LDI r20, STRO r20, "r11="
LDI r5, 1
LDI r20, BUF
LDI r20, SCRATCH
STRO r20, "CLEAR"
LDI r1, 50
LDI r4, BUF
LDI r15, COL_LABEL
LDI r7, STR_BUF
LDI r7, 0x1A1A2E
DRAWTEXT r5, r1, r4, r5, r1, r4, r15, r7
LDI r1, r4, r15, r7
LDI r20, BUF
HALT