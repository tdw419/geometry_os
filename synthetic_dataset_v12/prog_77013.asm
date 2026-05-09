; DESCRIPTION: Renders a cyan box of size 39x18 starting at (405, 10).
; PLAN: r0=405(x), r1=10(y), r2=39(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 10
LDI r2, 39
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
