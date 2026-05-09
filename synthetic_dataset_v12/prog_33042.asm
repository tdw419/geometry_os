; DESCRIPTION: Renders a cyan box of size 107x70 starting at (61, 160).
; PLAN: r0=61(x), r1=160(y), r2=107(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 160
LDI r2, 107
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
