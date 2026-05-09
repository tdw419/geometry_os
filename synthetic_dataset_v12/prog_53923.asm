; DESCRIPTION: Renders a cyan box of size 83x115 starting at (98, 68).
; PLAN: r0=98(x), r1=68(y), r2=83(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 68
LDI r2, 83
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
