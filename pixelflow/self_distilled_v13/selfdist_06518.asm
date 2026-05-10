; DESCRIPTION: Creates a cyan filled rectangle of size 98x63 starting at (214, 194).
; PLAN: r0=214(x), r1=194(y), r2=98(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 194
LDI r2, 98
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
