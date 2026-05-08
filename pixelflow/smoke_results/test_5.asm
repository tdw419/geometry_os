; DESCRIPTION : Clear s the screen to bl a ck and the n h al ts .

; De m on st ra t es the screen us ing the W A S S S I _ P I X E L op code ( 0x 7 8 00 )
; S ho w s en d " A S CI I ' ( A S CI I 6 ), re sp on se with co p y ing
; 8 . U se s T RA M 0x 7 000 , n "
;
LDI r0, 1 ; mo de 1 : a p pro g ra m
LDI r9, 0x1000 ; s ou r ce
STRO r9, "Hello"

; -- Read b o ar d --
LDI r9, 0x1200
LDI r0, 1
STORE r9, r0

; S e t initi ali ze --
LDI r0, 0x1201
LDI r0, 121 ; p
STORE r9, r0
LDI r9, 0