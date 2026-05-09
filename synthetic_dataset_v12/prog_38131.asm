; DESCRIPTION: Renders a cyan box of size 54x90 starting at (139, 12).
; PLAN: r0=139(x), r1=12(y), r2=54(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 12
LDI r2, 54
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
