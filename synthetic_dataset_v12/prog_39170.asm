; DESCRIPTION: Renders a cyan box of size 93x107 starting at (237, 55).
; PLAN: r0=237(x), r1=55(y), r2=93(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 55
LDI r2, 93
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
