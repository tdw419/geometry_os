; DESCRIPTION: Renders a cyan box of size 10x93 starting at (284, 97).
; PLAN: r0=284(x), r1=97(y), r2=10(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 97
LDI r2, 10
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
