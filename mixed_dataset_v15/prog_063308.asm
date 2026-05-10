; DESCRIPTION: Renders a cyan box of size 98x85 starting at (387, 37).
; PLAN: r0=387(x), r1=37(y), r2=98(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 37
LDI r2, 98
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
