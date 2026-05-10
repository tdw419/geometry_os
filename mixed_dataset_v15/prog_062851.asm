; DESCRIPTION: Renders a cyan box of size 103x58 starting at (16, 107).
; PLAN: r0=16(x), r1=107(y), r2=103(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 107
LDI r2, 103
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
