; DESCRIPTION: Renders a cyan box of size 22x42 starting at (22, 107).
; PLAN: r0=22(x), r1=107(y), r2=22(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 107
LDI r2, 22
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
