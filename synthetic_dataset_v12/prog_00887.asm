; DESCRIPTION: Renders a red box of size 82x98 starting at (406, 46).
; PLAN: r0=406(x), r1=46(y), r2=82(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 46
LDI r2, 82
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
