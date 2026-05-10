; DESCRIPTION: Renders a cyan box of size 50x69 starting at (417, 42).
; PLAN: r0=417(x), r1=42(y), r2=50(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 42
LDI r2, 50
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
