; DESCRIPTION: Renders a cyan box of size 82x63 starting at (150, 125).
; PLAN: r0=150(x), r1=125(y), r2=82(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 125
LDI r2, 82
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
