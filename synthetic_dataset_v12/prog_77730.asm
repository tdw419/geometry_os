; DESCRIPTION: Renders a cyan box of size 103x76 starting at (330, 103).
; PLAN: r0=330(x), r1=103(y), r2=103(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 103
LDI r2, 103
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
