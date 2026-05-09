; DESCRIPTION: Renders a cyan box of size 38x42 starting at (216, 96).
; PLAN: r0=216(x), r1=96(y), r2=38(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 96
LDI r2, 38
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
