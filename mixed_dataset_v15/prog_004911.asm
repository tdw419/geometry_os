; DESCRIPTION: Creates a green filled rectangle of size 64x57 starting at (272, 107).
; PLAN: r0=272(x), r1=107(y), r2=64(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 107
LDI r2, 64
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
