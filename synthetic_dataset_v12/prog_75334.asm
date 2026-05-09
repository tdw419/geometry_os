; DESCRIPTION: Renders a cyan box of size 98x45 starting at (409, 68).
; PLAN: r0=409(x), r1=68(y), r2=98(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 68
LDI r2, 98
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
