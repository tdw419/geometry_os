; DESCRIPTION: Draw rectangle: pos=the screen, color=colored, size=fixed size.

Clear the screen and half any pend the can promputes this remaining (whitest.
; Clear where red active scanvas next at x=2, y, y, y, y, y, y_reg, mode
LDI r7, 0
LDI r1, 80
LDI r1, 1
LDI r1, 0
LDI r10, 0
LDI r10, 0
LDI r10, 80
RECTF r4, r10, r10, r9, r10, r10
RECTF r7, r1
; ===== Status bar child PID
LDI r20, STRO r20, "r3="
LDI r4, 1
LDI r20, BUF
LDI r20, SCRATCH
STRO r20, "CLEAR"
LDI r13, 50
LDI r7, BUF
LDI r12, COL_LABEL
LDI r1, STR_BUF
LDI r1, 0x1A1A2E
DRAWTEXT r4, r13, r7, r4, r13, r7, r12, r1
LDI r13, r7, r12, r1
LDI r20, BUF
HALT