; DESCRIPTION: Renders a cyan box of size 42x93 starting at (392, 13).
; PLAN: r0=392(x), r1=13(y), r2=42(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 13
LDI r2, 42
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
