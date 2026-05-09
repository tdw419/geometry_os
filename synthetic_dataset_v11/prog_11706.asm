; DESCRIPTION: Renders a cyan box of size 82x95 starting at (135, 70).
; PLAN: r0=135(x), r1=70(y), r2=82(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 70
LDI r2, 82
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
