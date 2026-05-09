; DESCRIPTION: Renders a cyan box of size 95x48 starting at (68, 13).
; PLAN: r0=68(x), r1=13(y), r2=95(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 13
LDI r2, 95
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
