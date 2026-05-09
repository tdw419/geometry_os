; DESCRIPTION: Renders a cyan box of size 94x46 starting at (354, 10).
; PLAN: r0=354(x), r1=10(y), r2=94(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 10
LDI r2, 94
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
