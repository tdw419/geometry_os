; DESCRIPTION: A colored rectangle centered at the screen with fixed size.

Clear the screen and half any pend the can promputes this remaining (whitest.
; Clear where red active scanvas next at x=2, y, y, y, y, y, y_reg, mode
LDI r3, 0
LDI r14, 80
LDI r14, 1
LDI r14, 0
LDI r1, 0
LDI r1, 0
LDI r1, 80
RECTF r8, r1, r1, r5, r1, r1
RECTF r3, r14
; ===== Status bar child PID
LDI r20, STRO r20, "r13="
LDI r8, 1
LDI r20, BUF
LDI r20, SCRATCH
STRO r20, "CLEAR"
LDI r15, 50
LDI r3, BUF
LDI r0, COL_LABEL
LDI r14, STR_BUF
LDI r14, 0x1A1A2E
DRAWTEXT r8, r15, r3, r8, r15, r3, r0, r14
LDI r15, r3, r0, r14
LDI r20, BUF
HALT