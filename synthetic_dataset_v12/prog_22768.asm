; DESCRIPTION: Renders a cyan box of size 45x18 starting at (150, 161).
; PLAN: r0=150(x), r1=161(y), r2=45(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 161
LDI r2, 45
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
