; DESCRIPTION: Renders a cyan box of size 70x86 starting at (195, 103).
; PLAN: r0=195(x), r1=103(y), r2=70(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 103
LDI r2, 70
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
