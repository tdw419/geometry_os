; DESCRIPTION: Creates a white filled rectangle of size 48x90 starting at (327, 137).
; PLAN: r0=327(x), r1=137(y), r2=48(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 137
LDI r2, 48
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
