; DESCRIPTION: Renders a cyan box of size 94x13 starting at (73, 192).
; PLAN: r0=73(x), r1=192(y), r2=94(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 192
LDI r2, 94
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
