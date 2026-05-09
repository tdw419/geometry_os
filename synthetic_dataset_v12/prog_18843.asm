; DESCRIPTION: Renders a cyan box of size 30x32 starting at (40, 83).
; PLAN: r0=40(x), r1=83(y), r2=30(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 83
LDI r2, 30
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
