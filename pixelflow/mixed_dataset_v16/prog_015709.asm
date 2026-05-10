; DESCRIPTION: Creates a blue filled rectangle of size 82x49 starting at (198, 166).
; PLAN: r0=198(x), r1=166(y), r2=82(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 166
LDI r2, 82
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
