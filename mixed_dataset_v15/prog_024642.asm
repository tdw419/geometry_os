; DESCRIPTION: Renders a cyan box of size 60x32 starting at (135, 98).
; PLAN: r0=135(x), r1=98(y), r2=60(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 98
LDI r2, 60
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
