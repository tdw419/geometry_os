; DESCRIPTION: Creates a cyan filled rectangle of size 54x86 starting at (376, 112).
; PLAN: r0=376(x), r1=112(y), r2=54(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 112
LDI r2, 54
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
