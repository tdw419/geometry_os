; DESCRIPTION: Renders a cyan box of size 62x24 starting at (293, 146).
; PLAN: r0=293(x), r1=146(y), r2=62(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 146
LDI r2, 62
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
