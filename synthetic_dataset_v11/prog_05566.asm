; DESCRIPTION: Renders a cyan box of size 50x87 starting at (18, 86).
; PLAN: r0=18(x), r1=86(y), r2=50(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 86
LDI r2, 50
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
