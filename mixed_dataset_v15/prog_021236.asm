; DESCRIPTION: Creates a cyan filled rectangle of size 63x61 starting at (269, 140).
; PLAN: r0=269(x), r1=140(y), r2=63(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 140
LDI r2, 63
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
