; DESCRIPTION: Renders a cyan box of size 63x90 starting at (21, 76).
; PLAN: r0=21(x), r1=76(y), r2=63(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 76
LDI r2, 63
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
