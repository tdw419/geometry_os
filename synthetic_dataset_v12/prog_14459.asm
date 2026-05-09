; DESCRIPTION: Renders a cyan box of size 101x95 starting at (90, 150).
; PLAN: r0=90(x), r1=150(y), r2=101(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 150
LDI r2, 101
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
