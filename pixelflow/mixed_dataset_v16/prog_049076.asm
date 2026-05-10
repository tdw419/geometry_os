; DESCRIPTION: Creates a cyan filled rectangle of size 72x72 starting at (43, 112).
; PLAN: r0=43(x), r1=112(y), r2=72(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 112
LDI r2, 72
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
