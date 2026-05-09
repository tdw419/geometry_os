; DESCRIPTION: Renders a cyan box of size 75x28 starting at (27, 197).
; PLAN: r0=27(x), r1=197(y), r2=75(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 197
LDI r2, 75
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
