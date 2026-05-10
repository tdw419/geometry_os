; DESCRIPTION: Creates a cyan filled rectangle of size 103x30 starting at (321, 181).
; PLAN: r0=321(x), r1=181(y), r2=103(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 181
LDI r2, 103
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
