; DESCRIPTION: Renders a cyan box of size 76x109 starting at (124, 128).
; PLAN: r0=124(x), r1=128(y), r2=76(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 128
LDI r2, 76
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
