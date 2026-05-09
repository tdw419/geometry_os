; DESCRIPTION: Renders a green box of size 21x42 starting at (187, 187).
; PLAN: r0=187(x), r1=187(y), r2=21(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 187
LDI r2, 21
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
